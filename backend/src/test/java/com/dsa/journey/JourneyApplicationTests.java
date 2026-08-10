package com.dsa.journey;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import java.io.File;
import java.nio.file.Files;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@SpringBootTest
class JourneyApplicationTests {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Test
	void contextLoads() throws Exception {
		System.out.println("=== START PATTERN VERIFICATION ===");
		List<String> dbPatternIds = jdbcTemplate.queryForList(
			"SELECT id::text FROM patterns",
			String.class
		);
		Set<String> dbPatternsSet = new HashSet<>(dbPatternIds);

		File migrationsDir = new File("src/main/resources/db/migration");
		File[] files = migrationsDir.listFiles((dir, name) -> name.endsWith(".sql"));
		
		Pattern uuidPattern = Pattern.compile("a0a00000-0000-0000-0000-[a-fA-F0-9]{12}");
		
		for (File file : files) {
			String content = Files.readString(file.toPath());
			Matcher matcher = uuidPattern.matcher(content);
			while (matcher.find()) {
				String refId = matcher.group().toLowerCase();
				if (!dbPatternsSet.contains(refId)) {
					System.out.println("MISSING PATTERN REF: in " + file.getName() + " -> " + refId);
				}
			}
		}
		System.out.println("=== END PATTERN VERIFICATION ===");
	}
}

