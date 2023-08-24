package app.dto.entity;

import app.enums.PointStateEnum;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Point {
	private long sequence;
	private int point;
	private String registeredAt;
	private PointStateEnum state;
	private long memberSequence;
}
