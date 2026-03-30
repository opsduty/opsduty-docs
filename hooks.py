"""MkDocs hooks for dynamic configuration."""

from datetime import datetime


def on_config(config, **kwargs):
    """Update configuration with dynamic values before build."""
    current_year = datetime.now().year
    config["copyright"] = (
        f"Copyright &copy; {current_year} OpsDuty - "
        '<a href="#__consent">Cookie Settings</a>'
    )
    return config
