package co.micol.prj.filerepo.web;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import co.micol.prj.filerepo.service.FilerepoService;
import co.micol.prj.filerepo.vo.FilerepoVO;

@Controller
public class FilerepoController {

	@Autowired
	private FilerepoService fileDao;
	
	@Autowired
	private String upLoadPath;
	
	@GetMapping("/fileUploadForm.do")
	public String fileUploadForm() {
		return "file/fileUploadForm";
	}
	
	@PostMapping("/fileUpload.do")
	public String fileUpload(FilerepoVO vo, MultipartFile file) {
		String fileName = file.getOriginalFilename();
		File target = new File(upLoadPath, fileName);
		try {
			FileCopyUtils.copy(file.getBytes(), target);
			// DB작업
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:home.do";
	}
	
}
