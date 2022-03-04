package co.micol.prj.filerepo.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
		return "fileup/fileUploadForm";
	}

	@RequestMapping("/fileList.do")
	public String fileList(Model model) {
		model.addAttribute("files", fileDao.filerepoSelectList());
		return "fileup/fileList";
	}

	@RequestMapping("/fileUpload.do")
	public String fileUpload(MultipartFile file, FilerepoVO vo) {
		// 원본 파일명
		String fileName = file.getOriginalFilename();
		// 고유한 유니크 이름 생성
		String id = UUID.randomUUID().toString();
		// 파일명 치환
		String targetFile = id + fileName.substring(fileName.lastIndexOf("."));
		File target = new File(upLoadPath, targetFile);
		try {
			FileCopyUtils.copy(file.getBytes(), target);
			vo.setFname(fileName); // 원본 파일명을 삽입
			vo.setRname(targetFile); // 변경된 파일명을 삽입
			fileDao.filerepoInsert(vo);
			// DB작업
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:home.do";
	}

	@ResponseBody
	@RequestMapping("/fileDownLoad.do")
	public void fileDownload(HttpServletResponse response) {
		String path = "C:\\DEV\\webspace\\20220303\\src\\main\\webapp\\fileUp\\test.png";
		FileInputStream fis = null;
		OutputStream out = null;
		try {
			File file = new File(path);
			String fileName = "test.png";
			response.setHeader("Content-Disposition", "attacthment; filename=\"" + fileName + "\";");
			response.setHeader("Content-Transfer-Encoding", "binary");
			out = response.getOutputStream();
			
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				fis.close();
				out.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@GetMapping("/download.do")
	public void download(HttpServletResponse response) throws Exception {
		try {
			String path = "C:\\DEV\\webspace\\20220303\\src\\main\\webapp\\fileUp\\test.png";

			File file = new File(path);
			response.setHeader("Content-Disposition", "attachment;filename=" + file.getName());

			FileInputStream fileInputStream = new FileInputStream(path);
			OutputStream out = response.getOutputStream();

			int read = 0;
			byte[] buffer = new byte[1024];
			while ((read = fileInputStream.read(buffer)) != -1) {
				out.write(buffer, 0, read);
			}

		} catch (Exception e) {
			throw new Exception("download error");
		}
	}

}
