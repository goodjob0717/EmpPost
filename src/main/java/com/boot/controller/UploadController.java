package com.boot.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.boot.dto.EmpAttachDTO;
import com.boot.service.UploadService;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Slf4j
public class UploadController {
	@Autowired
	private UploadService service;
	@PostMapping("/uploadAjaxAction") //jsp에서 만든 url : uploadAjaxAction
//	public void uploadAjaxPost(MultipartFile[] uploadFile) {
	//ResponseEntity : 파일 정보를 넘기기 위해서 사용
		public ResponseEntity<List<EmpAttachDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("@# upload ajax post...");
		
//		ResponseEntity -> 사용 가능하게
		List<EmpAttachDTO> list = new ArrayList<>();
		
		String uploadFolder = "D:\\dev\\upload"; //날짜별로 들어가게 로직를 짜야됨
		String uploadFolderPath = getFolder();
		//"D:\\dev\\upload"+년월일 폴더 생성
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("@# uploadPath => "+uploadPath);
		
		if (uploadPath.exists() == false) {
			// make yyyy/MM/dd folder
			uploadPath.mkdirs();
		}
		for (MultipartFile multipartFile : uploadFile) {
			log.info("================================");
			//getOriginalFilename : 업로드 되는 파일 이름
			log.info("@# 업로드 되는 파일 이름 => "+multipartFile.getOriginalFilename());
			//getSize : 업로드 되는 파일 크기
			log.info("@# 업로드 되는 파일 크기 => "+multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//UUID만들기
			UUID uuid = UUID.randomUUID();
			log.info("@# uuid"+uuid);
			
			EmpAttachDTO empAttachDTO = new EmpAttachDTO();
			empAttachDTO.setFilename(uploadFileName);
			empAttachDTO.setUuid(uuid.toString());
			empAttachDTO.setUploadpath(uploadFolderPath);
			log.info("@# boardAttachDTO 01 =>"+empAttachDTO);
			
			uploadFileName = uuid.toString()+"_"+uploadFileName;
			log.info("@# uploadFileName =>"+uploadFileName);
			
			//실제 저장 파일(경로와 파일 이름) : saveFile
			File saveFile = new File(uploadPath, uploadFileName);
			FileInputStream fis = null;
			
			try {
				multipartFile.transferTo(saveFile);
				
				if (checkFileExists(saveFile)) {
					empAttachDTO.setEmp_paper(true);
					log.info("@# empAttachDTO 02 => " + empAttachDTO);
				}
				list.add(empAttachDTO);
			} catch (Exception e) {
				log.error(e.getMessage());
			} finally {
				try {
					if (fis != null) fis.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}//end of for
		
		//파일 정보들을 list 객체에 담고, http 상태값은 정상으로 리턴
		return new ResponseEntity<List<EmpAttachDTO>>(list, HttpStatus.OK);
	}
	
		// 파일 존재 여부 확인
		public boolean checkFileExists(File file) {
			return file.exists();
		}

	//날짜별 폴더 생성(여기서만 사용할 수 있게 private을 사용)
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		log.info("@# str => "+str);
		//File.separator : 윈도우에 맞춰서 생성
		log.info("@# separator => "+File.separator);
		
		return str.replace("-", File.separator);
	}

	//이미지 체크 여부
	public boolean checkImageType(File file) {
		try {
			//이미지 파일인지 체크하기 위한 타입 probeContentType
			String contentType = Files.probeContentType(file.toPath());
			log.info("@# contentType => "+contentType);
			
			//startsWith : 파일 종류 판단 
			return contentType.startsWith("image");//참이면 이미지 파일
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; //거짓이면 이미지 파일이 아님
	}
	
	// 파일을 받아서 화면에 출력(byte 배열 타입)
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String filename) {
		log.info("@# display filename => " + filename);
		
		// 업로드 파일경로+이름
		File file = new File("D:\\dev\\upload\\" + filename);
		log.info("@# file => " + file);
		
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();
		
		// 파일 출력할 때 오류 잡기
		try {
			// 파일 타입을 헤더에 추가
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			// 파일 정보를 byte 배열로 복사 + 헤더 정보 + http 상태 정상을 결과에 저장
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String filename, String type) {
		log.info("@# deleteFile filename => "+filename);
		File file;
		
		try {
			//URLDecoder.decode : 서버에 올라간 파일을 삭제하기 위해서 디코딩
			 file = new File("D:\\dev\\upload\\"+URLDecoder.decode(filename, "UTF-8"));
			 file.delete();
			 
			 //이미지 파일이면 썸네일도 삭제
			 if (type.equals("image")) {
				 //getAbsolutePath : 절대경로(full path)
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("@# largeFileName => "+largeFileName);
				
				file = new File(largeFileName);
				file.delete();
			}
		} catch (Exception e) { //삭제할 파일이 없다
			e.printStackTrace();
			//예외 오류 발생시 not found 처리
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		//deleted : success 의 result 로 전송
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
	@GetMapping(value = "/getFilelist")
	public ResponseEntity<List<EmpAttachDTO>> getFilelist(@RequestParam HashMap<String, String> param) {
		log.info("@# getFilelist()");
		log.info("@# param"+param);
		log.info("@# param"+param.get("emp_postNo"));
		
		return new ResponseEntity<>(service.getFilelist(Integer.parseInt(param.get("emp_postNo"))),HttpStatus.OK);	
	}
	
	//모든 파일은 내부적으로 bit 값을 가짐(문서, 영상, 이미지, 소리)
	@GetMapping(value = "download")
	public ResponseEntity<Resource> download(String filename) {
		log.info("@# download filename"+filename);
		
		//파일을 리소스(자원)으로 변경, 파일을 비트값으로 전환
		Resource resource = new FileSystemResource("D:\\dev\\upload\\"+filename);
		log.info("@# resource"+resource);
		
		//리소스에서 파일명을 찾아서 변수에 저장
		String resourceName = resource.getFilename();
		
		//uuid를 제외한 파일명
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
		HttpHeaders headers = new HttpHeaders();
		
		try {
			//헤더에 파일 다운로드 정보 추가
			headers.add("Content-Disposition"
					, "attachment; filename="
					+ new String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//윈도우 다운로드시 필요한 정보 (리소스, 헤더, 상태OK)
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
}