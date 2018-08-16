package com.kh.moduhome;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

public class AbstractDAO {
    protected Log log = LogFactory.getLog(AbstractDAO.class);
    
    @Autowired
    private SqlSessionTemplate sqlSession;
    
    protected void printQueryId(String queryId) {
    	if(log.isDebugEnabled()) {
    		log.debug("\t QueryId  \t:  "+queryId);
    	}
    }
    
    public Object insert(String queryId) {
    	printQueryId(queryId);
    	return sqlSession.insert(queryId);
    }
    
    public Object insert(String queryId, Object parmas) {
    	printQueryId(queryId);
    	return sqlSession.insert(queryId,parmas);
    }
    
    public Object update(String queryId) {
    	printQueryId(queryId);
    	return sqlSession.update(queryId);
    }
    public Object update(String queryId,Object params) {
    	printQueryId(queryId);
    	return sqlSession.update(queryId, params);
    }
    
    public Object delete(String queryId) {
    	printQueryId(queryId);
    	return sqlSession.delete(queryId);
    }
    
    public Object delete(String queryId, Object params) {
    	printQueryId(queryId);
    	return sqlSession.delete(queryId,params);
    }
    
    public Object selectOne(String queryId) {
    	printQueryId(queryId);
    	return sqlSession.selectOne(queryId);
    }
    
    public Object selectOne(String queryId, Object params) {
    	printQueryId(queryId);
    	return sqlSession.selectOne(queryId, params);
    }
    
    //가입한 회원 아이디 중복확인
    @SuppressWarnings("rawtypes")
    public int selectMemberId(String queryId, Object params) {
    	printQueryId(queryId);
    	return sqlSession.selectOne(queryId, params);
    }
}
