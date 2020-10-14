package com.cos.board.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.cos.board.model.Board;

// 자동 Ioc 등록됨.
public interface BoardRepository extends JpaRepository<Board, Integer>{
	//public abstract 생략
	//m으로 시작하면 내가 만든거
	//:하면 알아서 바인딩해준다.
	@Query(value = "SELECT * FROM board WHERE id = :id", nativeQuery = true)
	Board mFindById(int id);
	
	@Modifying // 수정, 삭제, 저장 할 때 붙인다. 이게있어야 commit이 된다.
	@Query(value ="DELETE FROM board WHERE id = :id", nativeQuery = true)
	int mDeleteById(int id);
}
