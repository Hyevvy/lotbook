package app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class Review {
	private long sequence;
	private int rating;
	private String comment;
	private String createdAt;
	private String updatedAt;
	private boolean isDeleted;
	
	// FK
	private long memberSequence;
	private long productSequence;
}
