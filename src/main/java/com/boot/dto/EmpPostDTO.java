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
	private int emp_duty; //직무
	private int emp_career; //경력
	private String emp_stime; //근무시간start
	private String emp_etime;//근무끝나는시간end
	private String emp_workPlace; //근무지
	private int emp_type; //고용형태(계약직 정규직 인턴)
	private Timestamp emp_startDate;//공고 등록일
	private Timestamp emp_endDate;//공고 마감일
	private String emp_title; //공고명
	private String emp_content; //공고내용
	
	private List<EmpAttachDTO> attachList; //?
	
}
//	private boolean? emp_paper; //지원서류인데 데이터 따로 했었음
//    채용공고번호(pk) emp_postNo varchar20
//	  직무 emp_duty int
//	  경력 emp_career int
//    근무시간start emp_stime // varchar(10)
//    근무끝나는시간end emp_etime // varchar(10)
//    스킬(fk) emp_skill int ———————→ 스킬테이블에서 긁어와서 쓴다
//    근무지 emp_workPlace // varchar(20)
//    고용형태(계약직 정규직 인턴) emp_type // int
//    지원서류 emp_paper ? //업로드 있어서 보류
//    공고 등록일 emp_startDate timestamp 
//    공고 마감일 emp_endDate timestamp
//    공고명 emp_title varchar(20)
//    공고내용 emp_content varchar(200)