package com.kh.qna;

import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	
	@Resource(name = "qnaDAO")
	private QnaDAO qnaDAO;

	@Override
	public void insertModalQna(Map<String, Object> map) throws Exception {
		qnaDAO.insertModalQna(map);
	}
	
	
	

}
