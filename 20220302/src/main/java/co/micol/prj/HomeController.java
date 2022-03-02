package co.micol.prj;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.micol.prj.notice.vo.NoticeVO;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home/home";
	}

	// 메소드 오버로딩을 이용해 만듬.
	// 객체의 다형성
	@RequestMapping("/home.do")
	public String home(Model model) {
		return "home/home";
	}
}