package org.fkjava.j1303.ec.entity.generator;

import java.io.File;

import org.mybatis.generator.api.ShellRunner;

public class MyBatisConfigGenerator {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		File file = new File("");
		args = new String[2];
		args[0] = "-configfile";
		args[1] = file.getAbsolutePath() + "/src/mybatis-generator-config.xml";
		//args[2] = "-overwrite";
		ShellRunner.main(args);
	}

}
