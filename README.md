# cv-template

A simple CV template written in [Typst](https://typst.app).

- `template.typ`:
  - `cv` – setup, header, and section styling;
  - `contact` – component for icon + text + anchor;
  - `entry[...]` – a dated item (job, degree, training) with bullet points
  - `stack[...]` – bold tech-stack suffix for a bullet
- `cv.typ` – example CV (placeholder)
- `icons/` – [Lucide](https://lucide.dev) contact icons (ISC licence)
- `typst.toml` – package manifest, so the template can be imported from other repos

## Using the template (simple)

Install the Typst CLI, edit `cv.typ` and build with `typst compile cv.typ`.

This will create a `cv.pdf` in this folder.

You may need to install the font, if you do not have it.

## Using the template from another repo

This Nix flake exposes the template as a Typst package and sets `TYPST_PACKAGE_PATH`
to a Nix store path containing `local/cv-template/<version>/`.
In the other repo's `flake.nix`:

```nix
{
  inputs.cv-template.url = "github:jjtrigueiros/cv-template";
  outputs = { cv-template, ... }: { devShells = cv-template.devShells; };
}
```

Then in its `cv.typ`:

```typ
#import "@local/cv-template:0.1.0": contact, cv, entry, stack
```

The import version must match `version` in `typst.toml`.

## Development

Tools and fonts come from the Nix flake. Use `nix develop`.

If you use `direnv`, you can auto-start the flake on `cd`.
Remember to `direnv allow` once.

There is a `justfile` with common commands.
