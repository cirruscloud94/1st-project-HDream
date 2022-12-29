package com.honeydream.owner.downloadFile.controller;


import java.io.File;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.honeydream.common.domain.CommandMap;
import com.honeydream.owner.downloadFile.service.downloadFileService;

@Controller
public class downloadFileController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="downloadFileService")
	private downloadFileService downloadfileService;
	
	@RequestMapping(value="/owner/downloadFileFromCafeinfo")
	public void downloadFileFromCafeinfo(CommandMap commandMap, HttpServletResponse response, HttpSession session) throws Exception {
		
		Map<String, Object> map = downloadfileService.selectFileInfoFromCafeinfo(commandMap.getMap(), session); //첨부파일의 정보를 가져온다.
		
		String storedFileName = (String)map.get("CP_STORED_FILE_NAME");
		String originalFileName = (String)map.get("CP_ORIGINAL_FILE_NAME");
			
		//실제로 파일이 저장된 위치에서 해당 첨부파일을 읽어서 byte[]형태로 변환
		byte fileByte[] = FileUtils.readFileToByteArray(new File("/Users/hyeonjuchoi/Desktop/stsapp/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/hd/resources/upload/" + storedFileName));
		
						//FileUtils는 common.io의 FileUtils이다.(common.util.FileUtils 아님)
						//(pom.xml의 commons-io와 commons-fileupload dependency 라이브러리를 사용)
		
		//읽어들인 파일 정보를 화면에서 다운로드 할 수 있도록 변환
		response.setContentType("application.octet-stream");
		response.setContentLength(fileByte.length);
		
		//Content-Disposition속성은 해당 패킷이 어떤 형식의 데이터인지 알 수 있다.
													//첨부파일을 의미				첨부파일의 이름을 지정해주는 역할
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);	//byte[]타입으로 변환한 파일을 reponse를 통해 client로 보냄

		
		response.getOutputStream().flush();    //response를 정리하고(buffer를 비움)
		response.getOutputStream().close();	   //닫아준다.
	}
	
	@RequestMapping(value="/owner/downloadFileFromGoodsreg")
	public void downloadFileFromGoodsreg(CommandMap commandMap, HttpServletResponse response, HttpSession session) throws Exception {
		
		Map<String, Object> map = downloadfileService.selectFileInfoFromGoodsreg(commandMap.getMap(), session); //첨부파일의 정보를 가져온다.
		
		String storedFileName = (String)map.get("CP_STORED_FILE_NAME");
		String originalFileName = (String)map.get("CP_ORIGINAL_FILE_NAME");
			
		//실제로 파일이 저장된 위치에서 해당 첨부파일을 읽어서 byte[]형태로 변환
		byte fileByte[] = FileUtils.readFileToByteArray(new File("/Users/hyeonjuchoi/Desktop/stsapp/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/hd/resources/upload/" + storedFileName));
		
						//FileUtils는 common.io의 FileUtils이다.(common.util.FileUtils 아님)
						//(pom.xml의 commons-io와 commons-fileupload dependency 라이브러리를 사용)
		
		//읽어들인 파일 정보를 화면에서 다운로드 할 수 있도록 변환
		response.setContentType("application.octet-stream");
		response.setContentLength(fileByte.length);
		
		//Content-Disposition속성은 해당 패킷이 어떤 형식의 데이터인지 알 수 있다.
													//첨부파일을 의미				첨부파일의 이름을 지정해주는 역할
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);	//byte[]타입으로 변환한 파일을 reponse를 통해 client로 보냄

		
		response.getOutputStream().flush();    //response를 정리하고(buffer를 비움)
		response.getOutputStream().close();	   //닫아준다.
	}

}






















