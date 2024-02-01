package kr.co.softsoldesk.service;

import java.io.File;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.beans.PostBean;
import kr.co.softsoldesk.dao.PostDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class PostService {
	
	@Value("${path.upload}")
	private String path_upload;
	
	@Autowired
	private PostDao postDao;
	
	private String saveUploadFile(MultipartFile upload_photo) {
		String file_name = System.currentTimeMillis() + "_" + FilenameUtils.getBaseName(upload_photo.getOriginalFilename()) + "." +
								FilenameUtils.getExtension(upload_photo.getOriginalFilename());
	
		try {
			upload_photo.transferTo(new File(path_upload + "/" + file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return file_name;
	}
	

	public void addPostInfo(PostBean boardPostBean) {

		
		System.out.println(boardPostBean.getTitle());
		System.out.println(boardPostBean.getContent());
		System.out.println(boardPostBean.getUpload_photo().getSize());
		System.out.println("카테고리: " + boardPostBean.getCategory());
		System.out.println("지역: " + boardPostBean.getLocation());
		
		
		MultipartFile upload_photo = boardPostBean.getUpload_photo();
		
		if(upload_photo.getSize() > 0) {
			String file_name = saveUploadFile(upload_photo);
			System.out.println(file_name);
			boardPostBean.setPhoto(file_name);
		}
	}
}
