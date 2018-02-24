<#if (config.site_disqus_shortname?has_content && content.disqus_disabled!'false'?boolean == false)>
<div id="disqus_thread"></div>
<script>

/**
*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
var disqus_shortname = '${config.site_disqus_shortname}';
var disqus_config = function () {
this.page.url = '${content.noExtensionUri!(content.uri!config.site_host)}';  // Replace PAGE_URL with your page's canonical URL variable
<#if (content.disqus_identifier?has_content)>
this.page.identifier = ${content.disqus_identifier}; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
</#if>
};

(function() { // DON'T EDIT BELOW THIS LINE
var d = document, s = d.createElement('script');
s.src = '//'+ disqus_shortname + '.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
</#if>