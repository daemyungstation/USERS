package egovframework.rte.common;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import egovframework.com.utl.fcc.service.EgovStringUtil;

@Component
public class UserListExcelView extends AbstractExcelView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook wb, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HSSFSheet sheet = wb.createSheet();
		
		int rowIdx = 0;


		HSSFCellStyle titleStyle = wb.createCellStyle();
		titleStyle.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
		titleStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		titleStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		titleStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
		titleStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		titleStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		// 타이틀 설정
		
		String[] titleList = model.get("title").toString().split(",");
		
		if((String)model.get("big_title") !=""&&(String)model.get("big_title")!=null){
			HSSFCellStyle label = wb.createCellStyle();
			HSSFFont lf = wb.createFont();
			
			lf.setFontHeightInPoints ((short) 14); // 폰트 크기
			lf.setColor (lf.COLOR_NORMAL); // 검정색
			lf.setBoldweight (lf.BOLDWEIGHT_BOLD);
			lf.setFontName ("굴림체");	// 굴림체
			
			label.setBorderTop (label.BORDER_THIN);
			label.setBorderBottom (label.BORDER_THIN);
			label.setBorderLeft (label.BORDER_THIN);
			label.setBorderRight (label.BORDER_THIN);
			label.setFont (lf); // 제목 폰트스타일 지정
			label.setAlignment (label.ALIGN_CENTER); // 가운데 정렬
			label.setVerticalAlignment (label.VERTICAL_CENTER); // 가운데 정렬(세로)
			rowIdx=2;
			HSSFRow bigTitleRow = sheet.createRow(0);
			HSSFCell bigCell = bigTitleRow.createCell(1);
			bigCell.setCellValue(new HSSFRichTextString((String)model.get("big_title")));
			bigCell.setCellStyle(label);
			
			HSSFCellStyle label2 = wb.createCellStyle();
			HSSFFont lf2 = wb.createFont();
			
			lf2.setFontHeightInPoints ((short) 10); // 폰트 크기
			lf2.setColor (lf.COLOR_NORMAL); // 검정색
			//lf2.setBoldweight (lf.BOLDWEIGHT_BOLD);
			lf2.setFontName ("굴림체");	// 굴림체
			
			label2.setBorderTop (label2.BORDER_THIN);
			label2.setBorderBottom (label2.BORDER_THIN);
			label2.setBorderLeft (label2.BORDER_THIN);
			label2.setBorderRight (label2.BORDER_THIN);
			label2.setFont (lf2); // 제목 폰트스타일 지정
			label2.setAlignment (label2.ALIGN_CENTER); // 가운데 정렬
			label2.setVerticalAlignment (label2.VERTICAL_CENTER); // 가운데 정렬(세로)
			HSSFRow smallTitleRow = sheet.createRow(1);
			HSSFCell smallCell = smallTitleRow.createCell(1);
			smallCell.setCellValue(new HSSFRichTextString((String)model.get("small_title")));
			smallCell.setCellStyle(label2);
			
		}
		
		HSSFRow titleRow = sheet.createRow(rowIdx++);
			
		for (int i = 0; i < titleList.length; i++) {
			HSSFCell cell = titleRow.createCell(i);
			cell.setCellValue(new HSSFRichTextString(titleList[i]));
			cell.setCellStyle(titleStyle);
		}
	

		// 엑셀 서식 설정
		HSSFCellStyle numStyle = wb.createCellStyle();
		
		numStyle.setDataFormat(wb.createDataFormat().getFormat("#,##0"));

		HSSFCellStyle percentStyle = wb.createCellStyle();
		percentStyle.setDataFormat(wb.createDataFormat().getFormat("0%"));

		HSSFCellStyle dateStyle = wb.createCellStyle();
		dateStyle.setDataFormat(wb.createDataFormat().getFormat("yyyy/mm/dd"));

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");

		// 데이터 추가
		List<LinkedHashMap> list = (List)model.get("list");
		
		if(list != null)
		{
		 for(int j=0 ; j<list.size(); j++){
			 HSSFRow dataRow = sheet.createRow(rowIdx++);
			 int celIdx=0;
			 
			 for(Iterator linkitr = list.get(j).values().iterator(); linkitr.hasNext();){
				
					 HSSFCell dataCell = dataRow.createCell(celIdx);
					 dataCell.setCellValue(new HSSFRichTextString(EgovStringUtil.nullConvert(linkitr.next())));
				 
				 celIdx++;
			 }
			 
		 }
		}
		for (int i = 0; i < titleList.length; i++) {
			sheet.autoSizeColumn((short)i);
			sheet.setColumnWidth(i, (sheet.getColumnWidth(i))+512 );
		}

		// 파일 다운로드 시작
		String fileInfo = "attachment; filename=\"" + createFileName(request, model.get("fileName").toString()) + "\"";
		response.setHeader("Content-Disposition", fileInfo);
		
	}
	
	private String createFileName(HttpServletRequest request, String name) {
		String userAgent = request.getHeader("User-Agent");
  		String fileName = name;
  		try
  		{
	  		if (userAgent != null && userAgent.indexOf("MSIE 5.5") > -1) 
	  		{ 
	  			// MS IE 5.5 이하
	  			fileName = URLEncoder.encode(fileName, "UTF-8");
	  		} 
	  		else 
	  		{
	  		    if (userAgent != null && userAgent.toLowerCase().indexOf("firefox") > -1) 
	  		    {                            
	  		    	fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
	  		    } 
	  		    else 
	  		    {
	  		    	fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
	  		    }
	  		}
  		}
  		catch(Exception e)
  		{
  			e.printStackTrace();
  		}
  		SimpleDateFormat fileFormat = new SimpleDateFormat("yyyyMMdd_HHmmss");
  		fileName = fileName + fileFormat.format(new Date()) + ".xls";
  		return fileName;
	}

}
