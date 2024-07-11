package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmpAttachDTO {
	private String uuid;
	private String uploadpath;
	private String filename;
	private boolean emp_paper;
	private int emp_postNo;
	}
