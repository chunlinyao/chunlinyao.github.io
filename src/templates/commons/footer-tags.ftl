	<#if (config.render_tags?boolean == true)  && post.tags?? >
		<ul class="stats">
    	    <!-- Display the categories associated with this post -->
    	    <li><i class="fa fa-tags">&nbsp;</i>  Tags: </li>
    	    <#list post.tags as tag>
 	        <li><a href='${content.rootpath}${config.tag_path}/${tag}${config.output_extension}'>${tag}</a></li>
 	        </#list>

			<#if (config.site_disqus_shortname?has_content && (post.disqus_disabled!'false')?boolean == false)>
				<li><a class="icon fa-comment" href="${content.rootpath}${post.noExtensionUri!post.uri}#disqus_thread"
					data-disqus-url="${config.site_host}/${post.noExtensionUri!post.uri}"
					<#if (post.disqus_identifier?has_content)>data-disqus-identifier="${post.disqus_identifier}"</#if> > &nbsp;</a></li>
			</#if>
 		</ul>
 	</#if>
