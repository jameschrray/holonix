{ writeShellScriptBin }:

writeShellScriptBin "hn-rust-flush" ''
  echo "flushing cargo cache from user home directory"
  rm -rf ~/.cargo/registry;
  rm -rf ~/.cargo/git;

  echo "flushing cargo artifacts and cache from project directories"
  find . -wholename "**/.cargo" | xargs -I {} rm -rf {};
  find . -wholename "**/target" | xargs -I {} rm -rf {};

  echo "flushing cargo lock files"
  find . -name "Cargo.lock" | xargs -I {} rm {};

  echo "flushing binary artifacts from dist"
  rm -rf ./dist;
''