package com.kh.collecting;

public interface CollectingService {

	
	int collectingExist(int MG_NUMBER, int MEMBER_NUMBER) throws Exception;
	
	void collectingReg(int MG_NUMBER, int MEMBER_NUMBER) throws Exception;
	
	String collectingQuan(int MG_NUMBER) throws Exception;
	
	int disCollecting(int MG_NUMBER, int MEMBER_NUMBER) throws Exception;
	
}
