
   
package com.kh.e3i1.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.RestController;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@EnableSwagger2//swagger에서 사용하는 자원들을 활성화시키는 옵션
public class SwaggerCustomConfiguration {
	
	//<bean id="api" class="springfox.documentation.spring.web.plugins.Docket"/>
	@Bean
	public Docket api() {
		return new Docket(DocumentationType.SWAGGER_2)//문서화 유형 설정
							.select()//추임새 역할
								.apis(RequestHandlerSelectors.withClassAnnotation(RestController.class))
								.paths(PathSelectors.any())//분석할 주소 유형
							.build()
								.apiInfo(//문서의 대표정보
									new ApiInfoBuilder()
													.title("문서의 제목")
													.description("문서의 설명")
													.version("0.0.1")
													.license("MIT License")
												.build()
									)
								.useDefaultResponseMessages(false);//기본메세지 OFF
	}
	
}
