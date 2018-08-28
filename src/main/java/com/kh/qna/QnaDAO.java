package com.kh.qna;

import org.springframework.stereotype.Repository;
import com.kh.moduhome.AbstractDAO;
import java.util.Map;


@Repository("qnaDAO")
public class QnaDAO extends AbstractDAO{
	

	public void insertModalQna(Map<String, Object> map) throws Exception {	
		insert("qna.insertModalQna", map);
	}
	
}
