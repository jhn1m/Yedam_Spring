package co.micol.prj.filerepo.service;

import java.util.List;

import co.micol.prj.filerepo.vo.FilerepoVO;

public interface FilerepoService {
	List<FilerepoVO> filerepoSelectList();
	FilerepoVO filerepoSelect(FilerepoVO vo);
	int filerepoInsert(FilerepoVO vo);
	int filerepoUpdate(FilerepoVO vo);
	int filerepoDelete(FilerepoVO vo);
}
