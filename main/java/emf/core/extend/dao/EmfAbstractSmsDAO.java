package emf.core.extend.dao;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSessionFactory;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

public class EmfAbstractSmsDAO extends EgovAbstractMapper
{
	@Resource(name="smsSqlSession")
    public void setSqlSessionFactory(SqlSessionFactory sqlSession)
	{
    	super.setSqlSessionFactory(sqlSession);
    }
	 
	protected Log log = LogFactory.getLog(getClass());
}