Supplementary material accompanying our submission to GECCO 2025 titled, "Comparing PushGP and GPT-4o on Program
Synthesis with only Input-Output Examples." 


The results of testing 5 prompts to identify the best prompt for GPT-4o to be used in experiments against PushGP are give in prompts_results.csv
The code for statistical test (Fisher's Exact Test) on these results is given in llm_analysis.R
The resulting p-values are given in p_vals_stats_prompts.docx


The success rates for different PSB2 problems when used with PushGP, GPT-4o (data-only), and GPT-4o (text-only) are given in succ_rate.csv
The code for statistical test (Pairwise Chi-Squared Test) on these results is given in stat_test_succ_rate.R
The resulting p-values are given in p_vals_stats_succ_rate.docx

LLM experiments can be launched from the folder tilted LLM.
PushGP experiments can be launched from the folder tilted Clojush.
