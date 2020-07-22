# frozen_string_literal: true

class ShortenedLinkFormReflex < ApplicationReflex
  def close_modal
    @form_action = :none
  end

  def validate(params)
    @shortened_link = load_shortened_link(params)
    @shortened_link.validate
    @form_action = determine_form_action
  end

  def save(params)
    @shortened_link = load_shortened_link(params)
    @form_action = determine_form_action
    if @shortened_link.save
      @flash_notice = "Shortened Link saved successfully"
      @form_action = :none
    end
  end

  private

  def load_shortened_link(params)
    shortened_link = if params[:id].present?
                        ShortenedLink.find(params[:id])
                      else
                        ShortenedLink.new
                      end
    shortened_link.assign_attributes(shortened_link_params(params))

    shortened_link
  end

  def determine_form_action
    @shortened_link.persisted? ? :edit : :new
  end

  def shortened_link_params(params)
    ActionController::Parameters.new(params).require(:shortened_link).permit(:name, :shortened_path, :original_url)
  end
end
