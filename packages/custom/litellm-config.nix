{ writeTextFile
, ...
}: writeTextFile {
  name = "litellm-config";
  text = ''
    model_list:
      # OpenAI API models:
      # https://platform.openai.com/docs/models
      - model_name: gpt-3.5-turbo-16k
        litellm_params:
          model: gpt-3.5-turbo-16k
          api_key: "os.environ/OPENAI_API_KEY"
      - model_name: gpt-3.5-turbo-instruct
        litellm_params:
          model: gpt-3.5-turbo-instruct
          api_key: "os.environ/OPENAI_API_KEY"
      - model_name: gpt-3.5-turbo
        litellm_params:
          model: gpt-3.5-turbo
          api_key: "os.environ/OPENAI_API_KEY"
      - model_name: gpt-4-0125-preview
        litellm_params:
          model: gpt-4-0125-preview
          api_key: "os.environ/OPENAI_API_KEY"
      - model_name: gpt-4-0613
        litellm_params:
          model: gpt-4-0613
          api_key: "os.environ/OPENAI_API_KEY"
      - model_name: gpt-4-1106-preview
        litellm_params:
          model: gpt-4-1106-preview
          api_key: "os.environ/OPENAI_API_KEY"
      - model_name: gpt-4-1106-vision-preview
        litellm_params:
          model: gpt-4-1106-vision-preview
          api_key: "os.environ/OPENAI_API_KEY"
      - model_name: gpt-4-turbo-preview
        litellm_params:
          model: gpt-4-turbo-preview
          api_key: "os.environ/OPENAI_API_KEY"
      - model_name: gpt-4-turbo
        litellm_params:
          model: gpt-4-turbo
          api_key: "os.environ/OPENAI_API_KEY"
      - model_name: gpt-4-vision-preview
        litellm_params:
          model: gpt-4-vision-preview
          api_key: "os.environ/OPENAI_API_KEY"
      - model_name: gpt-4
        litellm_params:
          model: gpt-4
          api_key: "os.environ/OPENAI_API_KEY"
      - model_name: gpt-4o
        litellm_params:
          model: gpt-4o
          api_key: "os.environ/OPENAI_API_KEY"

      # Anthropic (Claude) API models:
      # https://docs.anthropic.com/en/docs/about-claude/models#model-names
      - model_name: claude-3-5-sonnet
        litellm_params:
          model: claude-3-5-sonnet-20240620
          api_key: "os.environ/ANTHROPIC_API_KEY"
      - model_name: claude-3-opus
        litellm_params:
          model: claude-3-opus-20240229
          api_key: "os.environ/ANTHROPIC_API_KEY"
      - model_name: claude-3-sonnet
        litellm_params:
          model: claude-3-sonnet-20240229
          api_key: "os.environ/ANTHROPIC_API_KEY"
      - model_name: claude-3-haiku
        litellm_params:
          model: claude-3-haiku-20240307
          api_key: "os.environ/ANTHROPIC_API_KEY"
  '';
  destination = "config.yaml";
}
