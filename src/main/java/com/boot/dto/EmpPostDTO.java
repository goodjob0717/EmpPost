package com.boot.dto;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmpPostDTO {
	private int emp_postNo; //채용공고번호
	private String emp_duty; //직무
	private String emp_career; //경력
	private String emp_status; //학력	
	private int emp_money; 	//연봉
	private String emp_stime; //근무시간start
	private String emp_etime;//근무끝나는시간end
	private String emp_workPlace; //근무지
	private String emp_type; //고용형태(계약직 정규직 인턴)
	private Timestamp emp_startDate;//공고 등록일
	private Timestamp emp_endDate;//공고 마감일
	private String emp_endDateStr; //추가 타임랩스마감일 -> 디비추가X
	private String emp_title; //공고명
	private String emp_content; //공고내용
	private String corpInfo; //기업업종
	private String user_id;
	
	private List<EmpAttachDTO> attachList; //?
	
}

//${content_view.emp_endDate}

//create table empPost
//(emp_postNo int primary key--
//,emp_career int--
//,emp_status varchar(10) -- 학력
//,emp_duty varchar(10)--
//,emp_money int -- 급여
//,emp_stime varchar(10)
//,emp_etime varchar(10)--
//,emp_workPlace varchar(20)--
//,emp_type varchar(10) -- 고용형태--
//,emp_startDate Timestamp--
//,emp_endDate Timestamp--
//,emp_title varchar(20)--
//,emp_content varchar(200)--
//,corpInfo varchar(5) -- 기업업종(ex 중견기업) 
