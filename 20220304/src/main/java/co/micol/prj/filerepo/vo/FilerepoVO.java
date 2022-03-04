package co.micol.prj.filerepo.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FilerepoVO {
	private int id;
	private String writer;
	private String fname;
	private String rname;
	private Date enterDate;
}
