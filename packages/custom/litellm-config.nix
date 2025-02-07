{ writeTextFile
, ...
}: writeTextFile {
  name = "litellm-config";
  text = builtins.readFile ./litellm-config.yaml;
  destination = "/config.yaml";
}
