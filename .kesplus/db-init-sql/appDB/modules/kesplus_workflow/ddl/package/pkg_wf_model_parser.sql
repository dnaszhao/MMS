CREATE OR REPLACE PACKAGE "kesplus_workflow"."pkg_wf_model_parser" AUTHID CURRENT_USER AS
	/**
	 * 该接口主要实现bpmn xml 文件的解析,返回JSON数据
	 *
	 */
	/**
	 * @Description 解析流程基本信息包括：流程定义Key、流程名称、流程类型、流程各个环节信息
	 * @param process_key : 流程定义Key
	 * @Return JSON 数据
	 */
	FUNCTION parsing_bpmn_by_key(process_key varchar) RETURNS JSONB ;
	/**
	 * @Description 解析流程基本信息包括：流程定义Key、流程名称、流程类型、流程各个环节信息
	 * @param modelId : 流程模型Id
	 * @Return JSON 数据
	 */
	FUNCTION parsing_bpmn_by_id(modelId varchar) RETURNS JSONB ;
	/**
	 * 解析bpmn的XML,返回JSON数据
	 */
	FUNCTION parsing_bpmn_by_xml(bpmn_xml XML) RETURNS JSONB ;
	xmlns varchar[] :=  ARRAY[
						ARRAY['xsi', 'http://www.w3.org/2001/XMLSchema-instance'],
						ARRAY['bpmn', 'http://www.omg.org/spec/BPMN/20100524/MODEL'],
						ARRAY['camunda', 'http://camunda.org/schema/1.0/bpmn'],
						ARRAY['flowable', 'http://flowable.org/bpmn']
					];
	
	PROCESS_KEY CONSTANT varchar := '/bpmn:definitions/bpmn:process/@id';
	
	PROCESS_NAME CONSTANT varchar := '/bpmn:definitions/bpmn:process/@name';
	
	PROCESS_ISEXECUTABLE varchar := '/bpmn:definitions/bpmn:process/@isExecutable';
	
	PROCESS_CATALOG CONSTANT varchar := '/bpmn:definitions/bpmn:process/@flowable:processCategory';
	
	START_NODE_ID CONSTANT varchar  := '/bpmn:definitions/bpmn:process/bpmn:startEvent/@id';
	START_NODE_NAME CONSTANT varchar  := '/bpmn:definitions/bpmn:process/bpmn:startEvent/@name';
	START_NODE_OUTGOING CONSTANT varchar  := '/bpmn:definitions/bpmn:process/bpmn:startEvent/bpmn:outgoing/text()';
	
	USERTASK_DEF CONSTANT varchar  := '/bpmn:definitions/bpmn:process/bpmn:userTask';
	USERTASK_NODE_ID CONSTANT varchar  := '/bpmn:userTask/@id';
	USERTASK_NODE_NAME CONSTANT varchar  := '/bpmn:userTask/@name';
	USERTASK_NODE_ASSIGNEE CONSTANT varchar  := '/bpmn:userTask/@camunda:assignee';
	USERTASK_NODE_CANDIDATEUSERS CONSTANT varchar  := '/bpmn:userTask/@camunda:candidateUsers';
	USERTASK_NODE_BTNGROP CONSTANT varchar  := '/bpmn:userTask/@camunda:btnGroup';
	USERTASK_NODE_INCOMING CONSTANT varchar  := '/bpmn:userTask/bpmn:incoming/text()';
	USERTASK_NODE_OUTGOING CONSTANT varchar  := '/bpmn:userTask/bpmn:outgoing/text()';
	
	USERTASK_NODE_MULTIINSTANCE CONSTANT varchar  := '/bpmn:userTask/bpmn:multiInstanceLoopCharacteristics';
	USERTASK_NODE_MULTIINSTANCE_ISSEQUENTIAL CONSTANT varchar  := '/bpmn:userTask/bpmn:multiInstanceLoopCharacteristics/@isSequential';
	USERTASK_NODE_MULTIINSTANCE_ELEMENTVARIABLE CONSTANT varchar  := '/bpmn:userTask/bpmn:multiInstanceLoopCharacteristics/@camunda:elementVariable';
	
	END_NODE_ID CONSTANT varchar  := '/bpmn:definitions/bpmn:process/bpmn:endEvent/@id';
	END_NODE_NAME CONSTANT varchar  := '/bpmn:definitions/bpmn:process/bpmn:endEvent/@name';
	END_NODE_INCOMING CONSTANT varchar  := '/bpmn:definitions/bpmn:process/bpmn:endEvent/bpmn:incoming/text()';
	
	SEQ_FLOW CONSTANT varchar  := '/bpmn:definitions/bpmn:process/bpmn:sequenceFlow';
	SEQ_FLOW_ID CONSTANT varchar  := '/bpmn:sequenceFlow/@id';
	SEQ_FLOW_NAME CONSTANT varchar  := '/bpmn:sequenceFlow/@name';
	SEQ_FLOW_SREF CONSTANT varchar  := '/bpmn:sequenceFlow/@sourceRef';
	SEQ_FLOW_TREF CONSTANT varchar  := '/bpmn:sequenceFlow/@targetRef';
	SEQ_FLOW_CONDITION_TYPE CONSTANT varchar := '/bpmn:sequenceFlow/bpmn:conditionExpression/@xsi:type';
	SEQ_FLOW_CONDITION CONSTANT varchar  := '/bpmn:sequenceFlow/bpmn:conditionExpression/text()';
	
	EXCLUSIVEGATEWAY_DEF CONSTANT varchar  := '/bpmn:definitions/bpmn:process/bpmn:exclusiveGateway';
	EXCLUSIVEGATEWAY_ID CONSTANT varchar  := '/bpmn:exclusiveGateway/@id';
	EXCLUSIVEGATEWAY_NAME CONSTANT varchar  := '/bpmn:exclusiveGateway/@name';
	EXCLUSIVEGATEWAY_NODE_INCOMING CONSTANT varchar  := '/bpmn:exclusiveGateway/bpmn:incoming/text()';
	EXCLUSIVEGATEWAY_NODE_OUTGOING CONSTANT varchar  := '/bpmn:exclusiveGateway/bpmn:outgoing/text()';
	
	PARALLELGATEWAY_DEF CONSTANT varchar  := '/bpmn:definitions/bpmn:process/bpmn:parallelGateway';
	PARALLELGATEWAY_ID CONSTANT varchar  := '/bpmn:parallelGateway/@id';
	PARALLELGATEWAY_NAME CONSTANT varchar  := '/bpmn:parallelGateway/@name';
	PARALLELGATEWAY_NODE_INCOMING CONSTANT varchar  := '/bpmn:parallelGateway/bpmn:incoming/text()';
	PARALLELGATEWAY_NODE_OUTGOING CONSTANT varchar  := '/bpmn:parallelGateway/bpmn:outgoing/text()';
END;

CREATE OR REPLACE PACKAGE BODY "kesplus_workflow"."pkg_wf_model_parser" AS WRAPPED
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
AJ5VRz95Zq3Hewfb4320fJybg28OJA==
END;
