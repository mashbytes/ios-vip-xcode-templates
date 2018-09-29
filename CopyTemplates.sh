#!/usr/bin/env bash

TEMPLATES_DIR="./Source"

if ! [ -d "${TEMPLATES_DIR}" ]; then
    echo "Could not find TEMPLATES_DIR '$TEMPLATES_DIR' (no such dir)"
    exit 1
fi

declare CONTROLLER_TYPES
CONTROLLER_TYPES=(
	"UIViewController"
)

declare DIRS_TO_COPY
# TODO: automatically read directory names
DIRS_TO_COPY=(
    "${TEMPLATES_DIR}/Interactor.xctemplate"
    "${TEMPLATES_DIR}/Models.xctemplate"
    "${TEMPLATES_DIR}/Presenter.xctemplate"
    "${TEMPLATES_DIR}/Router.xctemplate"
    "${TEMPLATES_DIR}/Worker.xctemplate"
    "${TEMPLATES_DIR}/Bootstrap.xctemplate"
)

SCENE_DIR="Scene.xctemplate"

for controller_type in "${CONTROLLER_TYPES[@]}"
do
	target_dir="${TEMPLATES_DIR}/${SCENE_DIR}/${controller_type}"
	rm -r "${target_dir}"
	mkdir -p "${target_dir}"
	if [ -d "${target_dir}" ]; then
		for source_dir in "${DIRS_TO_COPY[@]}"
		do
			echo "Copying ${source_dir}/*.swift -> ${target_dir}"
    		cp -f "${source_dir}"/*.swift "${target_dir}"
		done

		controller_specific_template="${TEMPLATES_DIR}/View Controller.xctemplate/${controller_type}"
		echo "Copying ${controller_specific_template}/*.swift -> ${target_dir}"
		cp -f "${controller_specific_template}"/*.swift "${target_dir}"

	else
    	echo "Could not find target_dir '$target_dir' (no such dir)"
	fi

done

function copy_templates_to_scene {
    local dir="$1"

    local bash_files=$(ls $dir/.bash_profile_* 2> /dev/null | wc -l)

    if [ $bash_files != '0' ]; then
    for file in $dir/.bash_profile_* ; do
    source_path "$file"
    done
    fi
}
