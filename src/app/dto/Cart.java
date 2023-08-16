package app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class Cart {
	private long productSequence; //FK
	private long memberSequence; //FK
	
	private int count;
	private int updatedAt;
	private boolean isDeleted;
}
