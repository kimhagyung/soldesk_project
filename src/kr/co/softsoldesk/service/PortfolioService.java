package kr.co.softsoldesk.service;

import java.io.File;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.beans.PortFolioBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.dao.ProPortfolioDAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class PortfolioService {

	@Autowired
	private ProPortfolioDAO proPortfoliodao;

	@Value("${path.portfolio}")
	private String path_portfolio;

	@Resource(name = "loginProuserBean")
	private ProUserBean loginProuserBean;

	public void addProPortfolioInfo(PortFolioBean ProPortfolio, List<MultipartFile> uploadFiles) {
		String fileNames = uploadFiles.stream().map(MultipartFile::getOriginalFilename)
				.collect(Collectors.joining(","));
		ProPortfolio.setDetailed_images(fileNames);

		for (MultipartFile uploadFile : uploadFiles) {
			String photo_name = FilenameUtils.getBaseName(uploadFile.getOriginalFilename()) + "."
					+ FilenameUtils.getExtension(uploadFile.getOriginalFilename());

			try {
				uploadFile.transferTo(new File(path_portfolio + "/" + photo_name));
			} catch (Exception e) {
				e.printStackTrace();
			} 
		} 
		ProPortfolio.setPro_id(loginProuserBean.getPro_id());
		proPortfoliodao.addProPortfolioInfo(ProPortfolio);
		System.out.println("PortfolioService"+ProPortfolio.getService_type());
		System.out.println("PortfolioService"+ProPortfolio.getPortfolio_title());
		System.out.println("PortfolioService"+ProPortfolio.getWork_period());
	}
}
