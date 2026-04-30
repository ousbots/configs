# Add github private repositories env var.
status is-interactive; and begin
    set --global --export GOPRIVATE github.com/ousbots
end
