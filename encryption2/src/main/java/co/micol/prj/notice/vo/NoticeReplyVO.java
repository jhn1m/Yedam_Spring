package co.micol.prj.notice.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeReplyVO {
	private int replyNo; // ��� ����
	private int notice_id; // ���� ���̵�
	private String replyId; // �ۼ���
	private String replyContents; // ���
}
