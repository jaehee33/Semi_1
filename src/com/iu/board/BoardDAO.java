package com.iu.board;

import java.util.List;

import com.iu.util.MakeRow;

public interface BoardDAO {

	public int insert(BoardDTO boardDTO) throws Exception;
	
	public BoardDTO selectOne(int num) throws Exception;
	
	public List<BoardDTO> selectList(MakeRow makeRow)throws Exception;
	
	public int delete(int num) throws Exception;
	
	public int update(BoardDTO boardDTO) throws Exception;
	
	public int getTotalCount(MakeRow makeRow)throws Exception;
	
	public int hit(int num)throws Exception;
	
	
	
	
}
