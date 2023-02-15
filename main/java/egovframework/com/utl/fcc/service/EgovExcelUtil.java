/**
 * @Class Name  : EgovStringUtil.java
 * @Description : 문자열 데이터 처리 관련 유틸리티
 * @Modification Information
 *
 *     수정일         수정자                   수정내용
 *     -------          --------        ---------------------------
 *   2009.01.13     박정규          최초 생성
 *   2009.02.13     이삼섭          내용 추가
 *
 * @author 공통 서비스 개발팀 박정규
 * @since 2009. 01. 13
 * @version 1.0
 * @see
 *
 */

package egovframework.com.utl.fcc.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.service.EgovProperties;
import emf.core.vo.EmfMap;


/*
 * Copyright 2001-2006 The Apache Software Foundation.
 *
 * Licensed under the Apache License, Version 2.0 (the ";License&quot;);
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS"; BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

public class EgovExcelUtil {
	 /**
     * 파일 객체를 받아서 파일을 저장하고 해당 엑셀파일을 읽어서 list로 반환한다.
     */
	public static List getExcelToList(MultipartHttpServletRequest multiRequest) throws Exception
	{
		final Map<String, MultipartFile> files = multiRequest.getFileMap();	
		List<EmfMap> filelist= null;
		String storePathString = "";
		String filePath = "";
		String fileExt = "";
		try
		{
			String[] checkFileExt = new String[]{"xls","xlsx"};
			storePathString = EgovProperties.getProperty("Globals.fileStorePath");
			File saveFolder = new File(EgovWebUtil.filePathBlackList(storePathString));
			if (!saveFolder.exists() || saveFolder.isFile()) {
			    saveFolder.mkdirs();
			}
			Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
			MultipartFile file;
			
			while (itr.hasNext()) {
			    Entry<String, MultipartFile> entry = itr.next();
			    file = entry.getValue();
			    if(file.getName().equals("excelfile"))
			    {
				    String orginFileName = file.getOriginalFilename();
				    
				    //--------------------------------------
				    // 원 파일명이 없는 경우 처리
				    // (첨부가 되지 않은 input file type)
				    //--------------------------------------
				    if ("".equals(orginFileName)) {
					continue;
				    }
				    ////------------------------------------
				    long _size = file.getSize();
				    
				    if (_size > (long)10000000) {
				    	continue;
				    }
			
				    int index = orginFileName.lastIndexOf(".");
				    //String fileName = orginFileName.substring(0, index);
				    fileExt = orginFileName.substring(index + 1);
				    boolean isFileExt = false;
				    if(checkFileExt != null)
				    {
				    	for(int q = 0 ; q < checkFileExt.length ; q++)
				    	{
				    		if(checkFileExt[q].trim().toLowerCase().equals(fileExt.toLowerCase()))
				    		{
				    			isFileExt = true;
				    			break;
				    		}
				    	}
				    }
				    if(!isFileExt)
				    {
				    	continue;
				    }
				    String newName = "TEMP" + EgovStringUtil.getTimeStamp();
				    if (!"".equals(orginFileName)) 
				    {
				    	filePath = storePathString + File.separator + newName;
				    	file.transferTo(new File(EgovWebUtil.filePathBlackList(filePath)));
				    }
			    }
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			throw new IOException();
		}
		ArrayList rtnList = new ArrayList();
		FileInputStream fis;
		Workbook wb = null;
		if("".equals(filePath))
		{
			return rtnList;
		}
		fis = new FileInputStream( filePath );
		if ("xlsx".equals(fileExt)) {
            // Excel 2007
            try {
                wb = new XSSFWorkbook(fis);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            // Excel 2003
            try {
                wb = new HSSFWorkbook(fis);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
		
		
		// 시트 개수
		String value = null;
		// 셀의 갯수
		int cells = 0;
		Row row;
        int sheetNum = wb.getNumberOfSheets(); 
        for (int k = 0; k < sheetNum; k++) 
        {
            Sheet sheet = wb.getSheetAt(k);
            // 로우 개수
            int rows = sheet.getPhysicalNumberOfRows();
            row = sheet.getRow(0);
            cells = row.getPhysicalNumberOfCells();
            for (int r = 1; r < rows; r++) 
            {
                row = sheet.getRow(r);
                ArrayList<String> map = new ArrayList<String>();
                if (row != null) 
                {
                    String[] excelRow = new String[cells];
                    for (int c = 0; c < cells; c++) 
                    {
                        Cell cell = row.getCell(c);
                        if (cell != null) 
                        {
                            switch (cell.getCellType()) 
                            {
                                case Cell.CELL_TYPE_FORMULA:
                                    value = cell.getCellFormula();
                                    break;
 
                                case Cell.CELL_TYPE_NUMERIC:
                                    value = "" + Integer.parseInt(String.valueOf(Math.round(cell.getNumericCellValue())));
                                    break;
 
                                case Cell.CELL_TYPE_STRING:
                                    value = "" + cell.getStringCellValue();
                                    break;
 
                                case Cell.CELL_TYPE_BLANK:
                                    value = "" + cell.getBooleanCellValue();
                                    break;
 
                                case Cell.CELL_TYPE_ERROR:
                                    value = "" + cell.getErrorCellValue();
                                    break;
                                default:
                            }                            
                        }
                        map.add(value);
                        value = "";
                    }
                }
                rtnList.add(map);
            }
        }
        
        if (fis != null) 
        {
			try 
			{
				fis.close();
			} 
			catch (Exception ignore) 
			{
			    System.out.println("EXCEL FILE IGNORED: " + ignore.getMessage());
			}
	    }
    
		return rtnList;
	}
	
	//엑셀 파일 필수값 체크
	public static boolean checkNull(Object str, ArrayList map, String rtn)
	{		
		if("".equals(EgovStringUtil.nullConvert(str)))
		{
			map.add(rtn);
			return false;
		}
		return true;
	}
	
	//엑셀 파일 숫자만 체크
	public static boolean checkNumber(Object number, ArrayList map, String rtn)
	{
		if(!EgovNumberUtil.getNumberValidCheck(String.valueOf(number)))
		{
			map.add(rtn);
			return false;
		}
		return true;
	}
	
	//엑셀 파일 Y/N값 체크
	public static boolean checkYn(Object str, ArrayList map, String rtn)
	{
		if(!"".equals(EgovStringUtil.nullConvert(str)))
		{
			if(!"Y".equals(str)&&!"N".equals(str))
			{
				map.add(rtn);
				return false;
			}
		}		
		return true;
	}
	
	//엑셀 파일 날짜형식 체크(ex:20150401)
	public static boolean checkDate(Object number, ArrayList map, String rtn)
	{
		if(!EgovNumberUtil.getNumberValidCheck(String.valueOf(number)))
		{
			map.add(rtn);
			return false;
		}else if(String.valueOf(number).length()!=8){
			map.add(rtn);
			return false;	
		}
		return true;
	}
	
	//엑셀 파일 면접시간 형식 체크(ex:13:00)
	public static boolean checkTime(Object str, ArrayList map, String rtn)
	{
		if(!"".equals(EgovStringUtil.nullConvert(str))){
			if(!EgovNumberUtil.getNumberValidCheck(String.valueOf(str).replace(":", "")))
			{
				map.add(rtn);
				return false;
			}else if(String.valueOf(str).length()!=5||String.valueOf(str).indexOf(":")!=3){
				map.add(rtn);
				return false;	
			}
		}
		return true;
	}
    
}
