package net.app.file.service;

import java.util.List;

import net.app.file.vo.FileVO;

public interface FileService {

	List<FileVO> getFileLst(FileVO fileVO);

	String insFileDo(FileVO fileVO);

	int delFileDo(FileVO fileVO);

    void insFileDo(List<FileVO> list, String parntsDtaId);

    void insFileDoAlone(FileVO fileVO, String parntsDtaId);

}
