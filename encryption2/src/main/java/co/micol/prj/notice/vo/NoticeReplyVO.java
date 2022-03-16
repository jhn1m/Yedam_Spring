package co.micol.prj.notice.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeReplyVO {
	private int replyNo; // 댓글 순번
	private int notice_id; // 원글 아이디
	private String replyId; // 작성자
	private String replyContents; // 댓글
}
