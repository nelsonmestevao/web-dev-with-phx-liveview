defmodule YapWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is rendered as component
  in regular views and live views.
  """
  use YapWeb, :html

  embed_templates "layouts/*"

  def app(assigns) do
    ~H"""
    <header class="navbar px-4 sm:px-6 lg:px-8">
      <div class="flex-1">
        <a href="/" class="flex-1 flex items-center gap-2">
          <svg
            class="h-12 fill-base-content"
            viewBox="0 0 691 273"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path d="M343.344 213.996C332.787 213.996 323.442 211.785 315.31 207.362C307.321 202.797 301.043 196.448 296.478 188.316C292.055 180.041 289.844 170.34 289.844 159.212V156.644C289.844 145.516 292.055 135.886 296.478 127.754C300.901 119.479 307.107 113.131 315.096 108.708C323.085 104.143 332.359 101.86 342.916 101.86C353.331 101.86 362.39 104.214 370.094 108.922C377.798 113.487 383.79 119.907 388.07 128.182C392.35 136.314 394.49 145.801 394.49 156.644V165.846H317.236C317.521 173.122 320.232 179.043 325.368 183.608C330.504 188.173 336.781 190.456 344.2 190.456C351.761 190.456 357.325 188.815 360.892 185.534C364.459 182.253 367.169 178.615 369.024 174.62L391.066 186.176C389.069 189.885 386.144 193.951 382.292 198.374C378.583 202.654 373.589 206.363 367.312 209.502C361.035 212.498 353.045 213.996 343.344 213.996ZM317.45 145.73H367.098C366.527 139.595 364.031 134.673 359.608 130.964C355.328 127.255 349.693 125.4 342.702 125.4C335.426 125.4 329.648 127.255 325.368 130.964C321.088 134.673 318.449 139.595 317.45 145.73ZM409.93 211V104.856H436.466V118.766H440.318C442.03 115.057 445.24 111.561 449.948 108.28C454.656 104.856 461.789 103.144 471.348 103.144C479.622 103.144 486.827 105.07 492.962 108.922C499.239 112.631 504.09 117.839 507.514 124.544C510.938 131.107 512.65 138.811 512.65 147.656V211H485.686V149.796C485.686 141.807 483.688 135.815 479.694 131.82C475.842 127.825 470.278 125.828 463.002 125.828C454.727 125.828 448.307 128.61 443.742 134.174C439.176 139.595 436.894 147.228 436.894 157.072V211H409.93ZM581.603 213.996C571.046 213.996 561.701 211.785 553.569 207.362C545.58 202.797 539.302 196.448 534.737 188.316C530.314 180.041 528.103 170.34 528.103 159.212V156.644C528.103 145.516 530.314 135.886 534.737 127.754C539.16 119.479 545.366 113.131 553.355 108.708C561.344 104.143 570.618 101.86 581.175 101.86C591.59 101.86 600.649 104.214 608.353 108.922C616.057 113.487 622.049 119.907 626.329 128.182C630.609 136.314 632.749 145.801 632.749 156.644V165.846H555.495C555.78 173.122 558.491 179.043 563.627 183.608C568.763 188.173 575.04 190.456 582.459 190.456C590.02 190.456 595.584 188.815 599.151 185.534C602.718 182.253 605.428 178.615 607.283 174.62L629.325 186.176C627.328 189.885 624.403 193.951 620.551 198.374C616.842 202.654 611.848 206.363 605.571 209.502C599.294 212.498 591.304 213.996 581.603 213.996ZM555.709 145.73H605.357C604.786 139.595 602.29 134.673 597.867 130.964C593.587 127.255 587.952 125.4 580.961 125.4C573.685 125.4 567.907 127.255 563.627 130.964C559.347 134.673 556.708 139.595 555.709 145.73ZM648.189 211V104.856H675.153V211H648.189ZM661.671 92.444C656.82 92.444 652.683 90.8747 649.259 87.736C645.977 84.5973 644.337 80.46 644.337 75.324C644.337 70.188 645.977 66.0507 649.259 62.912C652.683 59.7733 656.82 58.204 661.671 58.204C666.664 58.204 670.801 59.7733 674.083 62.912C677.364 66.0507 679.005 70.188 679.005 75.324C679.005 80.46 677.364 84.5973 674.083 87.736C670.801 90.8747 666.664 92.444 661.671 92.444Z" />
            <path
              fill-rule="evenodd"
              clip-rule="evenodd"
              d="M169.477 118H240V102H0V118H70.5219C60.6868 123.069 51.6008 129.664 43.6319 137.632C23.3779 157.886 11.9994 185.357 11.9994 214H27.9994C27.9994 189.6 37.6922 166.2 54.9455 148.946C72.1989 131.693 95.5994 122 119.999 122C144.399 122 167.8 131.693 185.053 148.946C202.306 166.2 211.999 189.6 211.999 214H227.999C227.999 185.357 216.621 157.886 196.367 137.632C188.398 129.664 179.312 123.069 169.477 118ZM119.999 154C104.086 154 88.8251 160.321 77.573 171.574C66.3208 182.826 59.9994 198.087 59.9994 214L43.9994 214C43.9994 193.844 52.0065 174.513 66.2593 160.26C80.512 146.007 99.8429 138 119.999 138C140.156 138 159.487 146.007 173.739 160.26C187.992 174.513 195.999 193.844 195.999 214H179.999C179.999 198.087 173.678 182.826 162.426 171.574C151.174 160.321 135.912 154 119.999 154ZM120 170C108.33 170 97.1388 174.636 88.8872 182.887C80.6356 191.139 75.9999 202.33 75.9999 214L91.9999 214C91.9999 206.574 94.9499 199.452 100.201 194.201C105.452 188.95 112.574 186 120 186C127.426 186 134.548 188.95 139.799 194.201C145.05 199.452 148 206.574 148 214H164C164 202.33 159.364 191.139 151.113 182.887C142.861 174.636 131.669 170 120 170Z"
            />
          </svg>
        </a>
      </div>
      <div class="flex-none">
        <ul class="flex flex-column px-1 space-x-4 items-center">
          <li>
            <.link navigate={~p"/counter"} class="btn btn-ghost">Counter</.link>
          </li>
          <li>
            <.link navigate={"#"} class="btn btn-ghost">Global Counter</.link>
          </li>
          <li>
            <.link navigate={~p"/form"} class="btn btn-ghost">User Form</.link>
          </li>
          <li>
            <.link navigate={"#"} class="btn btn-ghost">Posts</.link>
          </li>
          <li>
            <.theme_toggle />
          </li>
          <li>
            <a href="https://hexdocs.pm/phoenix/overview.html" class="btn btn-primary">
              Learn more <span aria-hidden="true">&rarr;</span>
            </a>
          </li>
        </ul>
      </div>
    </header>

    <main class="px-4 py-20 sm:px-6 lg:px-8">
      <div class="mx-auto max-w-2xl space-y-4">
        {render_slot(@inner_block)}
      </div>
    </main>

    <.flash_group flash={@flash} />
    """
  end

  @doc """
  Shows the flash group with standard titles and content.

  ## Examples

      <.flash_group flash={@flash} />
  """
  attr :flash, :map, required: true, doc: "the map of flash messages"
  attr :id, :string, default: "flash-group", doc: "the optional id of flash container"

  def flash_group(assigns) do
    ~H"""
    <div id={@id} aria-live="polite">
      <.flash kind={:info} flash={@flash} />
      <.flash kind={:error} flash={@flash} />

      <.flash
        id="client-error"
        kind={:error}
        title={gettext("We can't find the internet")}
        phx-disconnected={show(".phx-client-error #client-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#client-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 h-3 w-3 motion-safe:animate-spin" />
      </.flash>

      <.flash
        id="server-error"
        kind={:error}
        title={gettext("Something went wrong!")}
        phx-disconnected={show(".phx-client-error #client-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#client-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Hang in there while we get back on track")}
        <.icon name="hero-arrow-path" class="ml-1 h-3 w-3 motion-safe:animate-spin" />
      </.flash>
    </div>
    """
  end

  @doc """
  Provides dark vs light theme toggle based on themes defined in app.css.

  See <head> in root.html.heex which applies the theme before page load.
  """
  def theme_toggle(assigns) do
    ~H"""
    <div class="card relative flex flex-row items-center border-2 border-base-300 bg-base-300 rounded-full">
      <div class="absolute w-[33%] h-full rounded-full border-1 border-base-200 bg-base-100 brightness-200 left-0 [[data-theme=light]_&]:left-[33%] [[data-theme=dark]_&]:left-[66%] transition-[left]" />

      <button phx-click={JS.dispatch("phx:set-theme", detail: %{theme: "system"})} class="flex p-2">
        <.icon name="hero-computer-desktop-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>

      <button phx-click={JS.dispatch("phx:set-theme", detail: %{theme: "light"})} class="flex p-2">
        <.icon name="hero-sun-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>

      <button phx-click={JS.dispatch("phx:set-theme", detail: %{theme: "dark"})} class="flex p-2">
        <.icon name="hero-moon-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>
    </div>
    """
  end
end
