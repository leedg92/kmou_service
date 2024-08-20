package rbs.egovframework.mapper;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;

/**
 * MART DB(개발)
 * @author user
 *
 */
public abstract class MartDevAbstractMapper extends RbsAbstractMapper{
	
	@Resource(name = "martDevSqlSession")
	public void setSqlSessionFactory(SqlSessionFactory sqlSession) {
		super.setSqlSessionFactory(sqlSession);
	}
}