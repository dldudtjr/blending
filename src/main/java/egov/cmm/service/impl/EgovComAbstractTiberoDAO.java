package egov.cmm.service.impl;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

public abstract class EgovComAbstractTiberoDAO extends EgovAbstractMapper {

    @Resource(name = "cms.sqlSession.tibero")
    public void setSqlSessionFactory(SqlSessionFactory sqlSession) {
        super.setSqlSessionFactory(sqlSession);
    }

}