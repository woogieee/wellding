package com.icia.web.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.icia.web.dao.WDMakeUpDao;
import com.icia.web.dao.WDRezDao;
import com.icia.web.model.WDMakeUp;
import com.icia.web.model.WDRez;

@Service("wdMakeUpService")
public class WDMakeUpService 
{
	private static Logger logger = LoggerFactory.getLogger(WDMakeUpService.class);
	
	@Autowired
	private WDMakeUpDao wdMakeUpDao;
	
	@Autowired
	private WDRezDao wdRezDao;
	
	//파일저장 디렉토리
	@Value("#{env['upload.save.dir']}")
	private String UPLOAD_SAVE_DIR;
	
	//총 메이크업 업체 수
	public long makeUpListCount(WDMakeUp wdMakeUp) 
	{
		long count = 0;
		
		try 
		{
			count = wdMakeUpDao.makeUpListCount(wdMakeUp);
		}
		catch(Exception e) 
		{
			logger.error("[WDMakeUpService] makeUpListCount Exception", e);
		}
		
		return count;
	}

	
	//메이크업 업체 가져오기
	public List<WDMakeUp> makeUpList(WDMakeUp wdMakeUp)
	{
		List<WDMakeUp> list = null;
		
		try 
		{
			list = wdMakeUpDao.makeUpList(wdMakeUp);
		}
		catch(Exception e) 
		{
			logger.error("[WDMakeUpService] makeUpList Exception", e);
		}
		
		return list;
	}
	
	//메이크업 상세보기페이지
	public WDMakeUp makeupSelect(String mCode)
	{
		WDMakeUp wdMakeup = null;
		
		try 
		{
			wdMakeup = wdMakeUpDao.makeupSelect(mCode);
		}
		catch(Exception e) 
		{
			logger.error("[WDMakeUpService] makeupSelect Exception", e);
		}
		
		return wdMakeup;
	}
	
	
   	//아이디로 조회했는데, 예약번호도 없고, 메이크업 코드도 없음. 트랜잭션으로 인서트 업데이트 한번에 진행
   	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
   	public long rezNoMakeupTotalInsert(WDRez wdRez) throws Exception
   	{
   		long cnt = 0;
   		//인서트
   		if( wdRezDao.rezNoInsert(wdRez) > 0) 
   		{
   			//예약번호 부여됨.
   			//메이크업 업데이트
   			cnt = wdRezDao.rezMakeupInsert(wdRez);
   		}
   		return cnt;
   	}
	
}
