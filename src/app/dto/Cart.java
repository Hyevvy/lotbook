package app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	private long sequence;
	private long productSequence; //FKs as composite Key
	private long memberSequence; //FKs as composite Key
	
	private int count;
	private int updatedAt;
	private boolean isDeleted;
}
