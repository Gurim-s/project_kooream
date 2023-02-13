package com.kooream.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface FollowMapper {
	public boolean checkFollowed(@Param("m_no") int m_no, @Param("follower") int follower);
	public int follow(@Param("m_no") int m_no, @Param("follower") int follower);
	public int unfollow(int m_no);
	public List<Integer> getFollowList(int m_no);
}
