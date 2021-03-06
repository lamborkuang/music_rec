<%@ page language="java" contentType="text/html; charset=UTF-8"
						 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">
    <title>Track Stacking</title>
	
  </head>
  <body>
  
   	<div class="container">
      	<h1></h1>
      	<h3>我的音乐<%-- ${oneDayOneWord}--%></h3>
      	<div class="row content hot-content">
      	    <!-- 前DIV -->
      	    <div class="col-sm-1">
      	        <!-- 小跳动特效框 -->
      	    	<div class=" ">
                        <span class="musicbar animate bg-empty inline m-r-lg m-t" style="width:50px;height:60px">
                          <span class="bar1 a3 lter"></span>
                          <span class="bar2 a5 lt"></span>
                          <span class="bar3 a1 bg"></span>
                          <span class="bar4 a4 dk"></span>
                          <span class="bar5 a2 dker"></span>
                        </span>
                </div><!-- 小跳动特效框 End-->
      	    </div><!-- 该前DIV为了中DIV居中 -->
      	    
      		<!--中DIV 歌曲部分-->
            <div class="col-sm-10 h-item" id="mytest"><!-- 中DIV -->
      		  <!-- One of three columns -->
      			

		<div class="row">
		  <div class="col-4">
		    <div class="list-group" id="list-tab" role="tablist">
		      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">我的收藏</a>
		      <a class="list-group-item list-group-item-action " id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">最近播放</a>
		    </div>
		  </div>
		  <div class="col-8">
			    <div class="tab-content" id="nav-tabContent">
			      <!-- 我的收藏 -->
			      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
			      		  <ul class="list-group list-group-flush" >
							<c:forEach items="${myCollectionList}" var="song" varStatus="status">
			                      <li class="list-group-item list-group-item-light " idd="${song.songId}" title="${song.songName}">
			                      	<!-- 歌曲信息区 -->
			                      	<div class="clear text-ellipsis">
			                          <span>${status.index+1}.${song.songName}</span>
			                          <span class="text-muted"> -- _ _ -- </span>
			                          <span class="text-danger icon-fire"></span>
			                        </div>
			                        <!-- 播放控制区 downloadFun(${song.songAddress})-->
			                        <div class="pull-right m-l fr">
				                        <a href="javascript:;" class="play m-r-sm" title="播放" onclick="playFunc(${song.songId})" id="play${song.songId}" name="${song.songName}" address="${song.songAddress}">
				                          <i class="icon-control-play text  "></i>
				                          <!-- <i class="icon-control-pause text-active"></i> -->
				                        </a>
				                        <a href="${pageContext.request.contextPath}/download.do?songAddress=${song.songAddress}&songId=${song.songId}" class="m-r-sm" title="下载"><i class="icon-cloud-download"></i></a>
				                         <a href="javascript:;"
				                         <c:choose>
				                         	<c:when test="${song.whetherCollected}">class="collect m-r-sm text-danger"</c:when>
				                         	<c:otherwise>class="collect m-r-sm"</c:otherwise>
				                         </c:choose>
				                         <%-- <c:if test="${song.whetherCollected}">class="collect m-r-sm text-danger" </c:if> --%>
				                         onclick="collectFunc(${song.songId})" id="${song.songId}" title="喜欢"><i class="icon-heart"></i>
				                         </a>
			                        </div>
			                      </li>
			                   </c:forEach>
			                 </ul>
			      </div><!-- 我的收藏 End-->
			      <!-- 最近播放 -->
			      <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
			      		<ul class="list-group list-group-flush" >
							<c:forEach items="${myRecentPlayList}" var="song" varStatus="status">
			                      <li class="list-group-item list-group-item-light " idd="${song.songId}" title="${song.songAddress}"  data-duration="${song.songLength}" data-name="${song.songName}">
			                      	<!-- 歌曲信息区 -->
			                      	<div class="clear text-ellipsis">
			                          <span>${status.index+1}.${song.songName}</span>
			                          <span class="text-muted"> -- _ _ -- </span>
			                          <span class="text-danger icon-fire"></span>
			                        </div>
			                        <!-- 播放控制区 downloadFun(${song.songAddress})-->
			                        <div class="pull-right m-l option fr">
				                        <a href="javascript:;" class="play m-r-sm" title="播放">
				                          <i class="icon-control-play text  "></i>
				                          <!-- <i class="icon-control-pause text-active"></i> -->
				                        </a>
				                        <a href="${pageContext.request.contextPath}/download.do?songAddress=${song.songAddress}&songId=${song.songId}" class="m-r-sm" title="下载"><i class="icon-cloud-download"></i></a>
				                         <a href="javascript:;"
				                         <c:choose>
				                         	<c:when test="${song.whetherCollected}">class="collect m-r-sm text-danger"</c:when>
				                         	<c:otherwise>class="collect m-r-sm"</c:otherwise>
				                         </c:choose>
				                         onclick="collectFunc(${song.songId})" id="second${song.songId}" title="喜欢"><i class="icon-heart"></i>
				                         </a>
			                        </div>
			                      </li>
			                   </c:forEach>
			                 </ul>
			      </div><!-- 最近播放 End-->
			      </div>
			    </div>
	  	</div>
	</div>
      		
      		
      		
   			 </div><!--中DIV 歌曲部分 End-->
   			 <!-- 后DIV -->
   			 <div class="col-sm-1"></div><!-- 该后DIV为了中DIV居中 -->
   			 
  	</div>
  	
  	<script>
	$(function(){
		$('#list-home').load("collectedFrameLoad.do");
		//处理我的收藏tab切换
		$('#list-tab a[href="#list-home"]').on('click', function (e) {
			$('#list-home').load("collectedFrameLoad.do");
		});
		//处理最近播放tab切换
		$('#list-tab a[href="#list-profile"]').on('click', function (e) {
			$('#list-profile').load("recentFrameLoad.do");
		});
	});
	</script>

  </body>
</html>
