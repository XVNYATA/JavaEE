package org.fkjava.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.fkjava.bean.Book;

public interface BookMapper {
	
	@Select("select * from tb_book")
	List<Book> findAll();

}
