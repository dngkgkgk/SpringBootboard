package com.cos.board.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data // -> Getter,Setter + toString합쳐져 있음
@Getter
@Setter
@NoArgsConstructor // 전체 파라메터를 가진 생성자
@AllArgsConstructor // 파라메터가 없는 생성자
@Builder // 빌터패턴
@Entity // ORM(Object Relational Mapping)
public class Board {
	@Id // 기본키 설정
	@GeneratedValue(strategy = GenerationType.IDENTITY) // 해당 데이터베이스 번호증가 전략을 따라가기 오라클이면 시퀀스 mysql 이면 auto increment
	private int id;
	private String title;
	private String content;
	private int readCount;
	@CreationTimestamp
	private Timestamp createDate;

	public String getCreateDate() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String dateformated = dateFormat.format(createDate);
		return dateformated;
	}
	
}
