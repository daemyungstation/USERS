package emf.core.extend.dao;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSessionFactory;

import javax.annotation.Resource;

public class EmfAbstractMallDAO extends EgovAbstractMapper
{
	@Resource(name="mallSqlSession")
    public void setSqlSessionFactory(SqlSessionFactory sqlSession)
	{
    	super.setSqlSessionFactory(sqlSession);
    }
	 
	protected Log log = LogFactory.getLog(getClass());
}