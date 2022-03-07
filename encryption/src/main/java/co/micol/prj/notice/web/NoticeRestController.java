package co.micol.prj.notice.web;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class NoticeRestController { // responsebody + mapping

	@PostMapping("/ajaxReplyInsert.do")
	public void ajaxReplyInsert(@RequestParam("a") String a, @RequestParam("b") int b) {
		System.out.println(a);
		System.out.println(b);
	}
}
