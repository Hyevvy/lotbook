package app.dto.mapper;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReviewWithNameMapper{
	private long sequence;
	private int rating;
	private String comment;
	private String createdAt;
	private String updatedAt;
	private boolean isDeleted;
	
	// FK
	private long memberSequence;
	private long productSequence;
	
	private String name;
}
