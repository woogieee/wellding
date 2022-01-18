package com.icia.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.icia.web.model.WDComment;

@Repository("WDCommentDao")
public interface WDCommentDao {
	
	public List<WDComment> commentList(long parentSeq);
	
	public int WDCommentInsert(WDComment wdComment);
	
	public int WDCommentMax(long parentSeq);
	
	public int commentDelete(WDComment wdComment);
	
	public int commentBoardDelete(long parentSeq);
	
	public int commentUpdate(WDComment wdComment);
	
	public int commentListCount(long parentSeq);
	
	//댓글 전부 불러오기 
	public List<WDComment> commentTotalSelect();
	
	//댓글 총 수 가져오기 
	public int commentTotalCnt();
	
	//관리자 페이지에서 댓글 삭제 시작
	public int commentDelAdm(WDComment wdComment);
	
}
