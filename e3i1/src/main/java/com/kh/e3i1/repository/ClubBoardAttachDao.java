package com.kh.e3i1.repository;

public interface ClubBoardAttachDao {

	int info(int clubBoardNo);

	void insert(int attachNo, int clubBoardNo, int clubNo);

}
